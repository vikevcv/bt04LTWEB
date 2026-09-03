package com.web.services;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import com.web.dao.OTPDao;
import com.web.dao.OTPDaoImpl;
import com.web.entity.EmailOTP;
import com.web.utils.EmailUtil;

public class OTPServiceImpl implements OTPService {

    private OTPDao otpDao = new OTPDaoImpl();

    @Override
    public void generateOTP(String email) {
        otpDao.deleteByEmail(email);
        String otpCode = generateRandomOTP();
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime expiresAt = now.plusMinutes(5);
        EmailOTP otp = new EmailOTP(email, otpCode, now, expiresAt);
        otpDao.insert(otp);
        EmailUtil.sendOTP(email, otpCode);
    }

    @Override
    public void generateResetPasswordOTP(String email) {
        otpDao.deleteByEmail(email);
        String otpCode = generateRandomOTP();
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime expiresAt = now.plusMinutes(5);
        EmailOTP otp = new EmailOTP(email, otpCode, now, expiresAt);
        otpDao.insert(otp);
        EmailUtil.sendResetPasswordOTP(email, otpCode);
    }

    @Override
    public boolean verifyOTP(String email, String otpCode) {
        EmailOTP otp = otpDao.findByEmail(email);
        if (otp == null) {
            return false; // Không tìm thấy OTP
        }
        if (LocalDateTime.now().isAfter(otp.getExpiresAt())) {
            otpDao.deleteByEmail(email); // Xóa OTP hết hạn
            return false; // OTP đã hết hạn
        }
        if (!otp.getOtpCode().equals(otpCode)) {
            return false; // Sai mã OTP
        }

        // OTP hợp lệ → xóa sau khi verify
        otpDao.deleteByEmail(email);
        return true;
    }

    private String generateRandomOTP() {
        SecureRandom random = new SecureRandom();
        int otp = 100000 + random.nextInt(900000); // 100000 - 999999
        return String.valueOf(otp);
    }
}

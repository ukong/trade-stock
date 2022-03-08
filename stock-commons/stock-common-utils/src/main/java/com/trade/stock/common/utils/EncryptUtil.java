package com.trade.stock.common.utils;

import com.trade.stock.common.exception.ComponentException;
import com.trade.stock.common.exception.enums.ApplicationErrorCodeEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;

/**
 * @author yuelimin
 * @version 1.0.0
 * @since 11
 */
public class EncryptUtil {

    private final static Logger logger = LoggerFactory.getLogger(EncryptUtil.class);
    private final static char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    public static String BASE64Encrypt;

    public static String MD5ToString(String signed) {

        char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        try {

            byte[] res = signed.getBytes("UTF-8");
            MessageDigest mdTemp = MessageDigest.getInstance("MD5".toUpperCase());
            mdTemp.update(res);
            byte[] md = mdTemp.digest();

            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return null;
        }
    }

    public static byte[] MD5(String str) {
        try {
            byte[] res = str.getBytes("UTF-8");
            MessageDigest mdTemp = MessageDigest.getInstance("MD5".toUpperCase());
            mdTemp.update(res);
            byte[] hash = mdTemp.digest();
            return hash;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * MD5值计算, MD5的算法在RFC1321中定义:
     * 在RFC 1321中，给出了Test suite用来检验你的实现是否正确：
     * MD5 ("") = d41d8cd98f00b204e9800998ecf8427e
     * MD5 ("a") = 0cc175b9c0f1b6a831c399e269772661
     * MD5 ("abc") = 900150983cd24fb0d6963f7d28e17f72
     * MD5 ("message digest") = f96b697d7cb7938d525a2f31aaf161d0
     * MD5 ("abcdefghijklmnopqrstuvwxyz") = c3fcd3d76192e4007dfb496cca67e13b
     *
     * @param str 源字符串
     * @return md5值
     */
    public static byte[] MD5EncrtyReutrnhexDigitsByteArray(String str) {
        try {
            byte[] res = str.getBytes("UTF-8");
            MessageDigest mdTemp = MessageDigest.getInstance("MD5".toUpperCase());
            mdTemp.update(res);
            byte[] hash = mdTemp.digest();
            return hash;
        } catch (Exception e) {
            return null;
        }
    }

    public static String MD5EncrtyReturnString(String str) {

        byte[] b = MD5EncrtyReutrnhexDigitsByteArray(str);

        StringBuffer resultSb = new StringBuffer();
        for (int i = 0; i < b.length; i++) {
            int n = b[i];
            if (n < 0) {
                n = 256 + n;
            }
            int d1 = n / 16;
            int d2 = n % 16;
            resultSb.append(HEX_DIGITS[d1]);
            resultSb.append(HEX_DIGITS[d2]);
        }
        return resultSb.toString();

    }

    /**
     * 加密后解密
     *
     * @param inStr
     * @return
     */
    public static String JM(byte[] inStr) {
        String newStr = new String(inStr);
        char[] a = newStr.toCharArray();
        for (int i = 0; i < a.length; i++) {
            a[i] = (char) (a[i] ^ 't');
        }
        return new String(a);
    }

    /**
     * BASE64加密MD5EncrtyReutrnhexDigitsByteArray
     *
     * @param key
     * @return
     * @throws Exception
     */
    public static String BASE64Encrypt(byte[] key) throws ComponentException {
        String edata = null;
        try {
            edata = Base64.getEncoder().encodeToString(key);
        } catch (Exception e) {
            throw new ComponentException(ApplicationErrorCodeEnum.SYS_ERROR_ENCRYPT_SINGED, "BASE64编码错误!key=" + new String(key) + ", error=" + e.getMessage());
        }
        return edata;
    }

    /**
     * base64解密
     *
     * @param data
     * @return
     */
    public static byte[] BASE64Decrypt(String data) {
        if (data == null) {
            return null;
        }
        byte[] edata = null;
        try {
            edata = Base64.getMimeDecoder().decode(data);
            return edata;
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return null;
    }

    public static byte[] dES3Encrypt(String key, String str) throws ComponentException {

        byte[] bt;
        try {
            byte[] newkey = key.getBytes();

            SecureRandom sr = new SecureRandom();

            DESedeKeySpec dks = new DESedeKeySpec(newkey);

            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DESede");

            SecretKey securekey = keyFactory.generateSecret(dks);

            Cipher cipher = Cipher.getInstance("DESede/ECB/PKCS5Padding");

            cipher.init(Cipher.ENCRYPT_MODE, securekey, sr);

            bt = cipher.doFinal(str.getBytes("utf-8"));

            return bt;

        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new ComponentException(ApplicationErrorCodeEnum.SYS_ERROR_ENCRYPT_SINGED, "DES3加密签名错误!key=" + key + ", str=" + str + ", error=" + e.getMessage());
        }

    }

    public static String DES3Decrypt(byte[] edata, String key) {
        String data = "";
        try {
            if (edata != null) {
                byte[] newkey = key.getBytes();
                DESedeKeySpec dks = new DESedeKeySpec(newkey);
                SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DESede");
                SecretKey securekey = keyFactory.generateSecret(dks);
                Cipher cipher = Cipher.getInstance("DESede/ECB/PKCS5Padding");
                cipher.init(Cipher.DECRYPT_MODE, securekey, new SecureRandom());

                byte[] bb = cipher.doFinal(edata);
                data = new String(bb, "UTF-8");
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return data;
    }

    /**
     * 签名加密
     *
     * @param signed
     * @return
     * @throws ComponentException
     */
    public static String encryptSigned(String signed) throws ComponentException {

        try {
            byte[] md5SignStr = MD5EncrtyReutrnhexDigitsByteArray(signed);
            String b64SignStr = BASE64Encrypt(md5SignStr);
            return b64SignStr;
        } catch (Exception e) {
            throw new ComponentException(ApplicationErrorCodeEnum.SYS_ERROR_ENCRYPT_SINGED, "BASE64或MD5加密签名错误!signed=" + signed + ", error=" + e.getMessage());
        }
    }

    public static String encryptSignedSelfTerminal(String signed) throws ComponentException {
        String b64SignStr = BASE64Encrypt(MD5ToString(signed).getBytes());
        return b64SignStr;
    }
}

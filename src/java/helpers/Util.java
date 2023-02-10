package helpers;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;

public class Util {

    public static byte[] UUIDToByteArray(UUID uuid) {
        ByteBuffer byteBuffer = ByteBuffer.wrap(new byte[16]);
        byteBuffer.putLong(uuid.getMostSignificantBits());
        byteBuffer.putLong(uuid.getLeastSignificantBits());
        return byteBuffer.array();
    }
    
    public static UUID ByteArrayToUUID(byte[] bytes) {
        ByteBuffer byteBuffer = ByteBuffer.wrap(bytes);
        long high = byteBuffer.getLong();
        long low = byteBuffer.getLong();
        return new UUID(high, low);
    }

    public static String hashingSHA256(String text) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(text.getBytes());
            return bytesToHex(hash);
        } catch (Exception e) {
        }
        return null;
    }

    public static String randomString(int length) {
        return randomString(length, 97, 122);
    }

    public static String randomString(int length, int lowerLimit, int upperLimit) {
        Random random = new Random();
        StringBuilder buffer = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int randomLimitedInt = lowerLimit + (int) (random.nextFloat() * (upperLimit - lowerLimit + 1));
            buffer.append((char) randomLimitedInt);
        }
        return buffer.toString();
    }

    public static void sendEmail(String to, String title, String content) {
        final String sender = "leoneduservice@gmail.com";
        final String password = System.getenv("EMAIL_PASS");
        if (password == null) {
            System.out.println("Cannot send email to " + to);
            return;
        }

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(
                prop,
                new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, password);
            }
        });

        CompletableFuture.runAsync(() -> {
            try {
                MimeMessage msg = new MimeMessage(session);
                msg.setSubject(title);
                msg.setText(content, "utf-8", "html");
                msg.setFrom(new InternetAddress(sender));
                msg.setRecipients(
                        Message.RecipientType.TO,
                        InternetAddress.parse(to)
                );
                Transport.send(msg);
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        });
    }

    private static String bytesToHex(byte[] bytes) {
        StringBuilder result = new StringBuilder();
        for (byte b : bytes) {
            result.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
        }
        return result.toString();
    }
}

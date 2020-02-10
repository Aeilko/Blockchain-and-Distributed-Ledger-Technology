package utils.hashing;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.util.encoders.Hex;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.Security;

public class SHA256 {
	public static String hash(String input){
		String result = null;

		Security.addProvider(new BouncyCastleProvider());

		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256", "BC");
			byte[] hash = digest.digest(input.getBytes(StandardCharsets.UTF_8));
			result = new String(Hex.encode(hash));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		}

		return result;
	}
}

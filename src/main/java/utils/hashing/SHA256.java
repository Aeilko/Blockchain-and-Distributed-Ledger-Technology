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

	public static String leadingZeros(String base, int zeros){
		return leadingZeros(base, zeros, false);
	}

	public static String leadingZeros(String base, int zeros, boolean displayProgress){
		String z = "";
		for(int i = 0; i < zeros; i++)
			z += "0";

		int i = 0;
		String nonce = "";
		while(true){
			nonce = Integer.toString(i);

			String h = SHA256.hash(base + nonce);
			String lead = h.substring(0, zeros);

			if(lead.equals(z))
				break;

			if(i%10000 == 0)
				System.out.println("Run\t\t" + i);
			i++;
		}

		return nonce;
	}
}

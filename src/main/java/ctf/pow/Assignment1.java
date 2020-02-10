package ctf.pow;

import utils.hashing.SHA256;

public class Assignment1 {
	public static void main(String[] args){
		String val = "Aeilko";
		String prev = "00000086bc76ab7f9c765d23d1c57d807f4d44cb83a639d36c59bed64ee7a9e7";

		String nonce = SHA256.leadingZeros(val + prev, 2, true);

		System.out.println("Val\t\t" + val);
		System.out.println("Prev\t" + prev);
		System.out.println("Nonce\t" + nonce);
		System.out.println("Hash\t" + SHA256.hash(val + prev + nonce));
	}
}

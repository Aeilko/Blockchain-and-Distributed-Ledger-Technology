package ctf.pow;

import utils.hashing.SHA256;

public class Assignment3 {
	public static void main(String[] args){
		String val = "Aeilko";
		String prev = "00000d4e7fb4008e61b498af5cc2db1739b5bcfad8ac5a16214db85f4a161be3";

		String nonce = SHA256.leadingZeros(val + prev, 6, true);

		System.out.println("Val\t\t" + val);
		System.out.println("Prev\t" + prev);
		System.out.println("Nonce\t" + nonce);
		System.out.println("Hash\t" + SHA256.hash(val + prev + nonce));
	}
}

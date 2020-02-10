package ctf.pow;

import utils.hashing.SHA256;

public class Assignment2 {
	public static void main(String[] args){
		String val = "Aeilko";
		String prev = "00f552e8c3bd0fef4c4c18c379f630113e48e7147ba1c8c46112543ff2d55c34";

		String nonce = SHA256.leadingZeros(val + prev, 4, true);

		System.out.println("Val\t\t" + val);
		System.out.println("Prev\t" + prev);
		System.out.println("Nonce\t" + nonce);
		System.out.println("Hash\t" + SHA256.hash(val + prev + nonce));
	}
}

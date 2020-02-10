package ctf.bitcoin;

import org.bitcoinj.core.Address;
import org.bitcoinj.core.NetworkParameters;
import org.bitcoinj.crypto.DeterministicHierarchy;
import org.bitcoinj.wallet.Wallet;

import java.util.List;

public class HighDefinition {
	public static void main(String[] args){

		NetworkParameters params = NetworkParameters.fromID(NetworkParameters.ID_MAINNET);
		String publicKey = "xpub6CdeAvF4G6inPigwhiF3tkV4RN4vxZTS8TqRqBHgXKTBypmeEhxbV4xSr4EXU5sUCnFYXkeAZm5h8RJeMgKVNhUyXxYXuAprmgta9AW1Zw5";

		Wallet wallet = Wallet.fromWatchingKeyB58(params, publicKey, DeterministicHierarchy.BIP32_STANDARDISATION_TIME_SECS);

		// Generate addresses
		for(int i = 0; i < 24; i++){
			wallet.freshReceiveAddress();
		}

		// Get 24th address
		List<Address> l = wallet.getIssuedReceiveAddresses();
		System.out.println("24th address\t" + l.get(23));
	}
}

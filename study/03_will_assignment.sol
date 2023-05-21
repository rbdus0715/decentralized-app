pragma solidity >= 0.7.0 < 0.9.0;

contract AddressWallets {

    address payable[] investorWallets; 
    
    mapping(address => uint) investors;
    
    // 1. Create a constructor function which can allocate an initial payable value to the contract upon deplayment. 
    uint fortune;
    constructor() payable {
        fortune = msg.value;
    }
    
    // 2. Create a function called payout which explicity prohibits outside visibility in the strict sense. 
    function payout() private {
        // 3. Write a for loop in the function that iterates over all the wallets of the investors.
        for(uint i=0; i<investorWallets.length; i++){
            // 4. While iterating through the wallets the loop should return a transfers of ethers equal to the amounts in each walet.
            investorWallets[i].transfer(investors[investorWallets[i]]);
        }
    }

    // 5. Write a function called makePayment which can then execute the payout function once deployed. 
    function makePayment() public {
        payout();
    }    

    function payInvestors(address payable wallet, uint amount) public {
        investorWallets.push(wallet);
        investors[wallet] = amount;
    }

    function checkInvestors() public view returns (uint) {
        return investorWallets.length;
    }    
}

// 6. Deploy the contract and test for successful transactions. (Hint: watch out for wei conversations!!)

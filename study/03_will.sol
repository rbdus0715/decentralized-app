pragma solidity >=0.8.2 <0.9.0;

contract Will {
    address owner;
    uint fortune;
    bool deceased;

    constructor() payable {
        owner = msg.sender;
        fortune = msg.value;
        deceased = false;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    modifier mustBeDeceased {
        require(deceased == true);
        _;
    }

    address payable[] famillyWallets;

    mapping(address => uint) inheritance;

    function setInheritance(address payable wallet, uint amount) public {
        famillyWallets.push(wallet);
        inheritance[wallet] = amount;
    }

    function payout() private mustBeDeceased {
        for(uint i=0; i<famillyWallets.length; i++){
            famillyWallets[i].transfer(inheritance[famillyWallets[i]]);
        }
    }

    function hasDeceased() public onlyOwner {
        deceased = true;
        payout();
    }

}

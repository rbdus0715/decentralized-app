pragma solidity >=0.8.2 <0.9.0;

contract Gcoin {
    address public minter;
    constructor() {
        minter = msg.sender;
    }

    // 등록자만, 코인을 제작하고 보냄
    mapping(address => uint) public balances;
    function makeCoinAndSend(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    // 누구나 코인 전송
    event Sent(address from, address to, uint amount);
    error lackBalance(uint requested, uint available);
    function send(address receiver, uint amount) public {
        if(amount > balances[msg.sender])
        revert lackBalance({
            requested: amount,
            available: balances[msg.sender]
        });
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }

    // 추가 기능
    // 1) 코인 제거
    function coinDelete() public {
        balances[msg.sender] = 0;
    }

    // 2) 
}

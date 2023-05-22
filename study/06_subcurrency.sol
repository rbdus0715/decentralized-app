pragma solidity >=0.8.2 <0.9.0;

/*
기능
암호화폐와 계약을 설정할 때 코인을 만든 본인만 새 코인을 발행할 수 있게 해야 함
등록하지 않고도 서로 코인을 전송할 수 있게 - 아이디 비밀번호 없이 오직 이더리움 키 쌍만 이용
*/
contract Coin {
    // 키워드를 public으로 설정한 이유 :
    // 다른 계약이 변수에 접근할 수 있도록
    address public minter;
    mapping(address => uint) public balances;

    // event : 클라이언트가 계약에서 일어나는 변화에 반응할 수 있도록
    // 이벤트 로그는 이더리움 블록체인에 저장됨, 계약 존재하는 한 계약 주소를 통해 접근 가능
    event Sent(address from, address to, uint amount);

    // 계약을 배포할 때만 생성자 함수 실행
    constructor(){
        minter = msg.sender;
    }
    
    // mint : 새로운 코인을 만들고 주소로 보냄
    // 소유자만 해당 코인을 보낼 수 있게 함
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    error insufficientBalance(uint requested, uint available);

    // send : 누구나 등록할 필요 없이 코인 보낼 수 있게 함
    function send(address receiver, uint amount) public {
        if(amount > balances[msg.sender])
        revert insufficientBalance({
            requested: amount,
            available: balances[msg.sender]
        });
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
    
}

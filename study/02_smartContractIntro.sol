pragma solidity >=0.7.0 <0.9.0;

// 조부모님이 돌아가시고 난 뒤 손자에게 재산을 상속하는 계약을 구현

contract Will {
    address owner;
    uint fortune;
    bool deceased;


    // 생성자 함수 : 스마트 계약을 배포할 때 실행되는 함수
    // payable을 작성한 함수에만 이더를 보낼 수 있다
    constructor() payable public {
        owner = msg.sender; // 주소
        fortune = msg.value; // 전송한 이더의 양
        deceased = false; // 조부모님이 돌아가시면 true
    }


    // 제어자 이용하기
    // 1) 계약을 호출할 수 있는 유일한 사람 : owner
    // 2) 조부모가 돌아가셨을 때만 상속이 이루어지도록
    modifier onlyOwner {
        // require : if와 같은 조건문
        require(msg.sender == owner);
        // 행동 제어 : 조건에 부합했을 때만 넘어갈 수 있음
        _;
    }

    modifier mustBeDeceased {
        require(deceased == true);
        _;
    }


    // 상속받을 사람들의 지갑 주소를 저장하는 리스트
    address payable [] familyWallets;
    
    // 유산에 대한 매핑 설정
    mapping(address => uint) inheritance;
    
    // 각 주소에 유산을 정하는 함수
    function setInheritance(address payable wallet, uint amount) public {
        // familyWallets에 월렛을 추가하는 코드
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }
}

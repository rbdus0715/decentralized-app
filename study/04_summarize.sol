pragma solidity >=0.8.2 <0.9.0;

contract ct {

    // 주소 배열
    address payable[] wallets;


    // 매핑
    mapping(address => uint) public balances;


    // 제어자
    address testAddress;
    constructor() {
        testAddress = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == testAddress);
        _;
        /*
        다음과 같이 바꿔서 사용할 수 있음
        if (msg.sender == testAddress) {
            _;
        }
        */
    }
    function test() public onlyOwner {
        // for test
    }


    // 생성자
    // 생성자가 없으면 계약 자체를 생성자로 봄

}

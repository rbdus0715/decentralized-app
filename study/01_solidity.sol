// 주석

// pragma : solidity 버전 -> 코드의 호환성 확인

pragma solidity >=0.7.0 <0.9.0;

/*
# 스마트 계약의 목적?
    데이터를 받아서 저장하고 반환할 수 있는 역할
# 실질적인 의미
    이더리움 블록체인의 특정 주소에 모여있는 
    코드(함수)와 데이터(상태)의 집합
    -> 계약을 배포할 때 발생
*/

// 객체 생성
contract simpleStorage{
    
    // 여러가지 데이터를 담을 변수
    uint storeData;
    string names = 'tom';
    bool switchON = true;

    // 함수
    // public : 함수의 가시성 -> 계약 밖에서도 함수 호출 가능
    // private : 함수를 바깥에서 사용하는 것을 막음
    function set(uint x) public {
        storeData = x;
    }

    // view : 상태를 수정할 수 없음 (전역 제어자)
    // 함수에 가시성을 부여하면서 상태가 수정되지 않도록, 반환 타입 지정
    function get() public view returns (uint) {
        return storeData; 
    }

}

pragma solidity ^0.4.25;

contract Overflow {
    mapping (address => uint256) public balances;

    // Hàm nạp tiền mô phỏng
    function deposit() public payable {
        balances[msg.sender] = msg.value;
    }

    // LỖ HỔNG: Không kiểm tra tràn số khi chuyển khoản
    function transfer(address _to, uint256 _value) public {
        // Kiểm tra xem người gửi có đủ tiền không
        // NHƯNG: balances[msg.sender] - _value có thể gây ra Underflow (tràn số âm)
        // Nếu _value > balances[msg.sender], kết quả sẽ thành một số dương cực lớn
        require(balances[msg.sender] - _value >= 0);
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;
    }
}
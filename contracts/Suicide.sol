pragma solidity ^0.4.25;

contract Suicide {
    address public owner;

    function Suicide() public {
        owner = msg.sender;
    }

    // LỖ HỔNG: Hàm này public và KHÔNG kiểm tra xem msg.sender có phải là owner không
    // Bất kỳ ai gọi hàm này cũng có thể xóa hợp đồng
    function kill() public {
        selfdestruct(msg.sender);
    }
}
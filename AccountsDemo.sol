pragma solidity >=0.4.22 <0.8.0;

contract AccountsDemo {
    address public whoDeposited;
    uint public depositAmt;
    address public empty_to;

    constructor(address payable _empty_to) public{
        empty_to = _empty_to;
    }
    
    function view_empty_to_balance() public view returns (uint){
        return empty_to.balance;
    }
    
    function view_contract_balance() public view returns (uint){
        return address(this).balance;
    }
    
    function check_account_balance(address checkit) public view returns (uint) {
        return checkit.balance;
    }
    
    function send_money(address payable to_addr, uint amount_sending) public payable returns (string memory){
        uint curr_balance = address(this).balance;
        if(curr_balance >= amount_sending) {
            address payable payable_addr = payable(to_addr); 
            payable_addr.transfer(amount_sending);
            return "successful";
        }
        else {
            return "insufficient funds";
        }
    }


    function empty() public payable{
        uint curr_balance = address(this).balance;
        address payable addr4 = payable(empty_to); 
        addr4.transfer(curr_balance);
    }

    function deposit() public payable {
        whoDeposited = msg.sender;
        depositAmt = msg.value;
    }

}
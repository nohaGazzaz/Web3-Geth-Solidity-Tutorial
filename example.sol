pragma solidity ^0.4.18;
// We have to specify what version of compiler this code will compile with

contract Example {
 
  mapping (bytes32 => uint32) public accounts;
  mapping (uint32 => string) public names;  

  uint32 public counter;

  

  
  function Example() public {
  counter = 0;
  }

// function to get customer count 
  function currNumber() constant returns (uint32) {
    return counter;
  }

//function to resturn withdraw ammount
  function withdrawl(bytes32 from, uint32 amount) constant returns (uint32) {
    accounts[from] -= amount;
    return accounts[from];
  }

//function to transfer between accounts
  function transfer(bytes32 from, bytes32 to, uint32 amount) constant returns (uint32) {
    accounts[from] -= amount;
    accounts[to] += amount;
    return accounts[from];
  }

//function to check balance
function checkBalance(bytes32 customer) constant returns (uint32) {
    return accounts[customer];
  }

//function to add a customer 
function addCustomer(bytes32 customer,string name, uint32 deposet) public {
    accounts[customer] = deposet;
    names[counter] = name;
    counter += 1;
    newCustomer (customer, name, deposet);
  }
// event to be called with blocknumber
event newCustomer (bytes32 accountNumber, string name, uint32 balance); 

}
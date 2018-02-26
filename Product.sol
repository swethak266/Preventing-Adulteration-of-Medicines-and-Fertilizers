pragma solidity ^0.4.19;
contract productDetails{
    
    struct product {
        string pName;
        uint manufactureDate;
        uint expiryDate;
        string pCode;
        string company;
        address pAddress;
        
    }
  address owner;
    mapping (address => product) products ; 
     function productDetails(){
        owner = msg.sender;
    }   

modifier ifOwner() {
        if (owner!=msg.sender){
            revert();
        }
        _;
}
function insertDetails(string _pName,uint _manufactureDate,uint _expiryDate,string _pCode,string _company) ifOwner {
        products[msg.sender].pAddress = msg.sender;
        products[msg.sender].pName = _pName;
        products[msg.sender].manufactureDate = _manufactureDate;
        products[msg.sender].expiryDate = _expiryDate;
        products[msg.sender].pCode = _pCode;
        products[msg.sender].company =_company;
}
 function getProductDetails( address pAddress,string pCode) constant returns(string,uint,uint,string,string){
if(keccak256(products[pAddress].pCode) == keccak256(pCode)){
        return (products[pAddress].pName, products[pAddress].manufactureDate,products[pAddress].expiryDate,

        products[pAddress].pCode,products[pAddress].company);
    }
 }

 function validateProduct(address pAddress,string prcode) constant returns(string){
        
        
                if(keccak256(products[pAddress].pCode) == keccak256(prcode)){
            return ("true");
        }
        else {
            return ("false");
        }
    }
}
 

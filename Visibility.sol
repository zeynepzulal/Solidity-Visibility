// SPDX-License-Identifier:MIT

pragma solidity ^0.8.17;

contract Visibility{
    /*
    public -> any contract ,any function and any account , (can inherit)

    private -> sadece tanimlandigi contract in içinde kullanilir 
    yani baska bir contact tarafindan çagirilamaz, ( can't inherit)

    internal -> inside contract, (can inherit)

    external -> other contracts , accounts can also access (can inherit)
    */


   //Privat ve Internal fonksiyonlar
   //Privat inherit edilemez
   //Internal inherit edilebilir.

    function privateFunc() private pure returns(string memory){
        return "private function called";
    }

    function changeFunc() public pure returns(string memory){
        return privateFunc();
    }



    function internalFunc() internal pure returns(string memory){
        return "internal func called";
    }

    function changeFunc2() public pure returns(string memory){
        return internalFunc();
    }

    
    //Public ve External fonksiyonlar
    //Public hem degiskenler hem fonksiyonlar icin kullanilabilirler
    //External sadece fonksiyonlar için kullanilir.

    function publicFunc() public pure returns(string memory){
        return "public func called";
    }

    function externalFunc() external pure returns(string memory){
        return "external func called";
    }



    //Private,internal ve public erisim belirleyicileri variables ler ile kullanilabilirler.
    string private privateVar = "Private variable";
    string internal internalVar = "Internal variable";
    string public publicVar = "Public variable";
    //degiskenler external olamazlar

    // external , public den daha az gas harcar çünkü public fonksiyonlarda default olarak get islevi bulunur. 

}

contract Child is Visibility{
    /*override
    function privareFunc() pure returns(string memory){
        return "Child private func called";
    }
    */

    function example() public pure returns(string memory){
        return changeFunc(); //privatFunc a ulastik
    }


}
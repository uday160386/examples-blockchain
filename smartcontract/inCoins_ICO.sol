pragma solidity ^0.7.4;

contract inCoin_ico {
    
    // introducing the maximum number of inCoins available for sealed
    uint public max_inCoins = 1000000;
    
    // Introducing the INR to inCoins converation relocatable
    uint public inr_to_inCoins = 100;
    
     //Introducing the total number of inCoins that have been bought by investors
    uint public total_inCoins_bought = 0;
     
    // mapping from the investor address to its equity in inCoins and INR
    mapping(address => uint) equity_inCoins;
    mapping(address => uint) equity_INR;
    
    // checking if a investor can buy inCoins
    modifier can_buy_inCoins(uint inr_invested) {
        require ( inr_invested * inr_to_inCoins + total_inCoins_bought <= max_inCoins);
        _;
    }
    
    function equity_in_inCoins(address investor) external returns (uint) {
        return equity_inCoins[investor];
    }
    
    function equity_in_INR(address investor) external  returns (uint) {
        return equity_INR[investor];
    }
    
    // buying inCoins
    function buy_inCoins(address investor, uint inr_invested) external
    can_buy_inCoins(inr_invested) {
        uint inCoins_bought = inr_invested * inr_to_inCoins;
        equity_inCoins[investor] += inCoins_bought;
        equity_INR[investor] = equity_inCoins[investor];
        total_inCoins_bought += inCoins_bought;
    }
    
    //selling inCoins
    function sell_inCoins(address investor, uint inCoins_sold) external {
        equity_inCoins[investor] -= inCoins_sold;
        equity_INR[investor] = equity_inCoins[investor] /1000;
        total_inCoins_bought -= inCoins_sold;
    } 
}
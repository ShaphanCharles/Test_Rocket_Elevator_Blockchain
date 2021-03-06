// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;
import "./ProjectOffice.sol";

contract MaterialProvider {

    //My Material object
    struct materialObj {
        string material;
        uint256 reqAmount;
    }


    //Array to store all the materials in a list and that list saved in a variable
    materialObj[] public materialList;
    materialObj matStruct;


    //Function that will be displayed in remix
    function pushMaterial(string memory material, uint256 reqAmount) private{
        matStruct.material = material;
        matStruct.reqAmount = reqAmount;
        materialList.push(matStruct);
    }


    //function that will handle pushing into the array above
    function getMaterial() public view returns (materialObj[] memory material) {
        return materialList;
    }


    //Declaring materials as variables and inside are the strings of each type of material
    string aluminumBar ="Aluminum Bars"; 
    string stainlessSheet ="Stainless Sheet"; 
    string steelCable ="Steel Cable";
    string hardware ="Hardware";
    string interior ="Interior";
    string display ="LED Displays";
    string wire = "Wire";
    string plastic = "Plastic";

    uint64 private index = 0;

    //Running calculations on the type and required amount of materials needed for this request
    function calcMaterial(address a) public 
    {
        ProjectOffice.Parts[] memory parts = ProjectOffice(a).getProjects();
        for(index;index<parts.length;index++) {  
            pushMaterial(aluminumBar, (parts[index].Shafts *10)); 
            pushMaterial(stainlessSheet, (parts[index].Shafts *12));
            pushMaterial(steelCable, (parts[index].Controllers *2)); 
            pushMaterial(hardware, (parts[index].Controllers *3));
            pushMaterial(interior, (parts[index].Doors *4));
            pushMaterial(display, (parts[index].Doors *1));
            pushMaterial(wire, (parts[index].Pulleys *2));
            pushMaterial(plastic, (parts[index].Buttons *2));
        }
    }
}
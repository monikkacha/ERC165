const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Store", function () {

    let store;
    let storeReader;
    let selector;

    before(async function () {
        const Store = await hre.ethers.getContractFactory("Store");
        store = await Store.deploy();
        await store.deployed();

        const StoreReader = await hre.ethers.getContractFactory("StoreReader");
        storeReader = await StoreReader.deploy(store.address);
        await storeReader.deployed();

        const Selector = await hre.ethers.getContractFactory("Selector");
        selector = await Selector.deploy();
        await selector.deployed();
    })

    it("Deployment", async () => {
        console.log("Store deployed to :", store.address);
        console.log("StoreReader deployed to :", storeReader.address);
        console.log("Selector deployed to :", selector.address);
    })

    it("Get selector value", async () => {
        var value2 = await selector.calcStoreInterfaceIdFor2();
        console.log(`selector for 2 functions : ${value2}`);
        var value3 = await selector.calcStoreInterfaceIdFor3();
        console.log(`selector for 3 functions : ${value3}`);
        var value4 = await selector.calcStoreInterfaceIdFor4();
        console.log(`selector for 4 functions : ${value4}`);
    })

    it("Store and check for value", async () => {
        store.setValue(5);
        var value = await store.getValue();
        expect(value).to.equal(5)
    })

    it("Read value", async () => {
        var value = await storeReader.readStoreValue();
        expect(value).to.equal(5);
    })

    it("Read second value", async () => {
        expect(storeReader.readSecondStoreValue(store.address)).to.be.reverted;
    })

});
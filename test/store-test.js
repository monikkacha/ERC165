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
        storeReader = await StoreReader.deploy();
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

    it("Get selector value for 2 ", async () => {
        var value = await selector.calcStoreInterfaceIdFor2();
        console.log(`selector value : ${value}`);
    })

    it("Get selector value for 3 ", async () => {
        var value = await selector.calcStoreInterfaceIdFor3();
        console.log(`selector value : ${value}`);
    })

    it("Store and check for value", async () => {
        store.setValue(5);
        var value = await store.getValue();
        expect(value).to.equal(5)
    })

    it("Read value", async () => {
        var value = await storeReader.readStoreValue(store.address);
        expect(value).to.equal(5);
    })

    it("Read second value", async () => {
        expect(storeReader.readSecondStoreValue(store.address)).to.be.reverted;
    })

});
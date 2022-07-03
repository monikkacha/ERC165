const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Store", function () {

    let store;
    let storeReader;

    before(async function () {
        const Store = await hre.ethers.getContractFactory("Store");
        store = await Store.deploy();
        await store.deployed();

        const StoreReader = await hre.ethers.getContractFactory("StoreReader");
        storeReader = await StoreReader.deploy();
        await storeReader.deployed();
    })

    it("Deployment", async () => {
        console.log("Store deployed to :", store.address);
        console.log("StoreReader deployed to :", storeReader.address);
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
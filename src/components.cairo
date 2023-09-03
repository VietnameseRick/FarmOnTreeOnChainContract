use array::ArrayTrait;
use starknet::ContractAddress;

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Game {
    #[key]
    player: ContractAddress,
    PlayerInfo: Option<playerInfo>,
    AncientTree: Option<treeInfo>
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct playerInfo {
    #[key]
    player: ContractAddress,
    budget: felt252,
    inventory: InventoryInfo,
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct treeInfo {
    #[key]
    player: ContractAddress,
    FirstFloor: Option<floorInfo>,
    SecondFloor: Option<floorInfo>,
    ThirdFloor: Option<floorInfo>,
    FourthFloor: Option<floorInfo>,
    FifthFloor: Option<floorInfo>,
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct floorInfo {
    #[key]
    player: ContractAddress,
    unlocked: bool,
    FirstPosition: Option<PositionInformation>,
    SecondPosition: Option<PositionInformation>,
    ThirdPosition: Option<PositionInformation>,
    FourthPosition: Option<PositionInformation>,
    FifthPosition: Option<PositionInformation>,
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct PositionInformation {
    #[key]
    player: ContractAddress,
    unlocked: bool,
    Pot: Option<potType>,
    Seed: Option<seedType>,
    timestampToCollect: felt252
}

#[derive(Serde, Drop, Copy, PartialEq)]
enum potType {
    normal,
    unnormal,
    rare
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct potStruct {
    #[key]
    player: ContractAddress,
    normalAmount: u256,
    unnormalAmount: u256,
    rareAmount: u256
}

#[derive(Serde, Drop, Copy, PartialEq)]
enum seedType {
    normal,
    unnormal,
    rare
}

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct seedStruct {
    #[key]
    player: ContractAddress,
    normalAmount: u256,
    unnormalAmount: u256,
    rareAmount: u256
}

const MAX_POTS: felt252 = 100; 
const MAX_SEEDS: felt252 = 100;

#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct InventoryInfo {
    #[key]
    player: ContractAddress,
    Pots: potStruct, 
    Seeds: seedStruct,        
}

impl playerInfoSerdeLen of dojo::SerdeLen<Option<playerInfo>> {
    #[inline(always)]
    fn len() -> usize {
        7
    }
}

impl floorInfoSerdeLen of dojo::SerdeLen<Option<floorInfo>> {
    #[inline(always)]
    fn len() -> usize {
        42
    }
}

impl treeInfoSerdeLen of dojo::SerdeLen<Option<treeInfo>> {
    #[inline(always)]
    fn len() -> usize {
        216
    }
}

impl PositionInformationSerdeLen of dojo::SerdeLen<Option<PositionInformation>> {
    #[inline(always)]
    fn len() -> usize {
        7
    }
}

impl potTypeSerdeLen of dojo::SerdeLen<Option<potType>> {
    #[inline(always)]
    fn len() -> usize {
        1
    }
}

impl seedTypeSerdeLen of dojo::SerdeLen<Option<seedType>> {
    #[inline(always)]
    fn len() -> usize {
        1
    }
}



#[system]
mod start {
    use array::ArrayTrait;
    use box::BoxTrait;
    use traits::{Into, TryInto};
    use option::OptionTrait;
    use dojo::world::Context;

    use Sovereign_Suits::components::{Game, playerInfo, treeInfo, InventoryInfo, potStruct, potType, seedStruct, seedType, floorInfo, PositionInformation};

    // so we don't go negative

    fn execute(ctx: Context) {
        set!(
            ctx.world,
            (
                Game {
                    player: ctx.origin, 
                    PlayerInfo: Option::Some(
                        playerInfo {
                            player: ctx.origin,
                            budget: 1000,
                            inventory: InventoryInfo {
                                player: ctx.origin,
                                Pots: potStruct { player: ctx.origin, 
                                                  normalAmount: 3, 
                                                  unnormalAmount: 3,
                                                  rareAmount: 3},
                                Seeds: seedStruct { player: ctx.origin,
                                                    normalAmount: 3, 
                                                    unnormalAmount: 3,
                                                    rareAmount: 3},
                            }
                        }
                    ),
                    AncientTree: Option::Some(
                        treeInfo {
                            player: ctx.origin,
                            FirstFloor: Option::Some(
                                floorInfo {
                                    player: ctx.origin,
                                    unlocked: true,
                                    FirstPosition: Option::Some(PositionInformation {
                                        player: ctx.origin,
                                        unlocked: true,
                                        Pot: Option::Some(potType::normal),
                                        Seed: Option::Some(seedType::normal),
                                        timestampToCollect: 0
                                    }),
                                    SecondPosition: Option::Some(PositionInformation {
                                        player: ctx.origin,
                                        unlocked: true,
                                        Pot: Option::None,
                                        Seed: Option::None,
                                        timestampToCollect: 0
                                    }),
                                    ThirdPosition: Option::Some(PositionInformation {
                                        player: ctx.origin,
                                        unlocked: true,
                                        Pot: Option::None,
                                        Seed: Option::None,
                                        timestampToCollect: 0
                                    }),
                                    FourthPosition: Option::None,
                                    FifthPosition: Option::None,
                                }
                            ),
                            SecondFloor: Option::None,
                            ThirdFloor: Option::None,
                            FourthFloor: Option::None,
                            FifthFloor: Option::None,
                        }
                    )
                }
            )
        );
        return ();
    }
}
import router from '@ohos.router';

/**
 * ListItem 的样式
 */
@Component
struct ListItem1 {
    name: string

    build() {
        Button() {
            Text(this.name)
                .textAlign(TextAlign.Center)
                .fontSize(18)
                .fontColor("white")
        }
        .width("100%")
        .padding(12)
    }
}


@Entry
@Component
struct Index {
    @State
    message: string = '我的模块1中缺省页'

    build() {
        List(
            {
                space: 16,
                initialIndex: 0,
            }
        ) {
            ListItem() {
                ListItem1(
                    {
                        name: "从 Page 中获取 UIAbility 实例",
                    }
                )
            }
            .onClick(
                () => {
                    router.pushUrl(
                        {
                            url: "pages/UiAbilityGetFromPage",
                        }
                    )
                }
            )
            ListItem() {
                ListItem1(
                    {
                        name: "Page 内部 LocalStorage 通信1",
                    }
                )
            }
            .onClick(
                () => {
                    router.pushUrl(
                        {
                            url: "pages/PageCommunicate1",
                        }
                    )
                }
            )
            ListItem() {
                ListItem1(
                    {
                        name: "Page 和 UIAbility 通信1",
                    }
                )
            }
            .onClick(
                () => {
                    router.pushUrl(
                        {
                            url: "pages/PageAndUiAbilityCommunicate1",
                        }
                    )
                }
            )
        }.margin(12)
    }
}
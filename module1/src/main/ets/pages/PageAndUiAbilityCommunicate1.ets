import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';

let storage = LocalStorage.GetShared()

@Entry(storage)
@Component
struct PageAndUiAbilityCommunicate1 {
    private context = getContext(this) as common.UIAbilityContext
    @LocalStorageProp("PageAndUiAbilityCommunicate1_key")
    private message: string = ""

    build() {
        Stack(
            {
                alignContent: Alignment.Center,
            }
        ) {
            Column() {
                Text("此界面演示了, 从 Page 发送消息给 UiAbility, UiAbility 接受消息并通过 LocalStorage 传递给 Page, Page 展示消息")
                    .fontSize(24)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(Color.Green)
                    .textAlign(TextAlign.Center)
                Button() {
                    Text("点我发送数据到 UiAbility, 接受的数据在下面会展示")
                        .fontSize(24)
                        .fontWeight(FontWeight.Bold)
                        .textAlign(TextAlign.Center)
                        .fontColor(Color.White)
                        .onClick(
                            () => {
                                this
                                    .context
                                    .eventHub
                                    .emit(
                                        "PageAndUiAbilityCommunicate1",
                                        `Hello, I am from PageAbility, CurrentTime: ${new Date().toLocaleString()}`,
                                    )
                            }
                        )
                }
                .padding(12)

                Text(this.message)
                    .fontSize(30)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(Color.Red)
            }

        }
        .width('100%')
        .height('100%')
    }

    onPageShow() {
        hilog.error(0x000, "onPageShow", `this: ${this}`)
        this.message = "onPageShow"
    }

    onPageHide() {
        this.message = "onPageHide"
    }
}
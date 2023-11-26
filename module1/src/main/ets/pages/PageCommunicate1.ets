import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';

let storage = new LocalStorage({ countStorage: 1 });

@Entry(storage)
@Component
struct PageCommunicate1 {

    private context = getContext(this) as common.UIAbilityContext
    @LocalStorageLink("PageCommunicate1_key")
    private message: string = ""

    build() {
        Stack(
            {
                alignContent: Alignment.Center,
            }
        ) {
            Column() {
                Text("此界面演示了 Page 内部的组件之间通过 LocalStorage 数据共享")
                    .fontSize(24)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(Color.Green)
                    .textAlign(TextAlign.Center)

                Text(`点我, Message: ${this.message}`)
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(Color.Red)
                    .padding(12)
                    .onClick(
                        () => {
                            this.message = "Message 信息已经被更改1"
                        }
                    )

                PageCommunicate1Widget()

            }

        }
        .width('100%')
        .height('100%')
    }

}

@Component
struct PageCommunicate1Widget {

    @LocalStorageLink("PageCommunicate1_key")
    private message: string = ""

    build() {
        Text(`点我, Message: ${this.message}`)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Red)
            .padding(12)
            .onClick(
                () => {
                    this.message = "Message 信息已经被更改2"
                }
            )
    }

}
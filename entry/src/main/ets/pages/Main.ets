import common from '@ohos.app.ability.common';


@Entry
@Component
struct Index {

  private context = getContext(this) as common.UIAbilityContext;

  @State
  message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(
            () => {
              let wantInfo = {
                deviceId: '', // deviceId为空表示本设备
                bundleName: 'com.xiaojinzi.interview',
                abilityName: 'Module1Ability',
                moduleName: 'module1', // moduleName非必选
                parameters: { // 自定义信息
                },
              }
                // 启动另一个 UiAbility
              this.context.startAbility(
                wantInfo
              ).then(
                (data) => {
                  console.info('startAbility success', data)
                },
                (err) => {
                  console.error('startAbility fail', err)
                }
              )
            }
          )
      }
      .width('100%')
    }
    .height('100%')
  }

}
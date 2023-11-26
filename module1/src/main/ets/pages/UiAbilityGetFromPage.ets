import common from '@ohos.app.ability.common';

@Entry
@Component
struct UiAbilityGetFromPage {
    private context = getContext(this) as common.UIAbilityContext;
    @State
    message: string = 'Hello World'

    build() {
        Stack(
            {
                alignContent: Alignment.Center,
            }
        ) {
            Text(`moduleName: ${this.context.abilityInfo.name}\nUIAbilityName: ${this.context.abilityInfo.moduleName}`)
                .textAlign(TextAlign.Center)
        }
        .width('100%')
        .height('100%')
    }
}
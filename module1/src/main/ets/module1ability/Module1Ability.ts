import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

let localStorage: LocalStorage = new LocalStorage(
  {
    "CommunicateBetweenPageAndUiAbility1_key": "",
  }
);

export default class Module1Ability extends UIAbility {

  onCreate(want, launchParam) {
    this.context.eventHub.on(
      "CommunicateBetweenPageAndUiAbility1",
      (data1) => {

        localStorage.setOrCreate(
          "CommunicateBetweenPageAndUiAbility1_key",
          `${data1}, this is from UiAbility`,
        )

      }
    )
  }

  onDestroy() {
    this.context.eventHub.off(
      "CommunicateBetweenPageAndUiAbility1",
    )
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index1', localStorage, (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });

  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}

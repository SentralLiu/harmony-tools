// 应用入口
import Ability from '@ohos.app.ability.UIAbility'
import window from '@ohos.window'

export default class EntryAbility extends Ability {
  onCreate(want, launchParam) {
    console.info('EntryAbility onCreate')
  }

  onDestroy() {
    console.info('EntryAbility onDestroy')
  }

  onWindowStageCreate(windowStage) {
    console.info('EntryAbility onWindowStageCreate')
    
    windowStage.setMainPage('pages/Index')
  }

  onWindowStageDestroy() {
    console.info('EntryAbility onWindowStageDestroy')
  }

  onForeground() {
    console.info('EntryAbility onForeground')
  }

  onBackground() {
    console.info('EntryAbility onBackground')
  }
}

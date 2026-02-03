/**
 * 功能模块基类
 * 所有新功能模块都应该继承此类
 */
export abstract class BaseFeature {
  // 模块名称
  abstract getName(): string
  
  // 模块描述
  abstract getDescription(): string
  
  // 模块版本
  getVersion(): string {
    return '1.0.0'
  }
  
  // 初始化
  onInit(): void {
    console.info(this.getName() + ' initialized')
  }
  
  // 销毁
  onDestroy(): void {
    console.info(this.getName() + ' destroyed')
  }
  
  // 页面进入
  onPageShow(): void {}
  
  // 页面离开
  onPageHide(): void {}
}

/**
 * 模块注册表
 * 用于管理所有可用的功能模块
 */
export class FeatureRegistry {
  private static instance: FeatureRegistry
  private features: Map<string, BaseFeature> = new Map()
  
  static getInstance(): FeatureRegistry {
    if (!FeatureRegistry.instance) {
      FeatureRegistry.instance = new FeatureRegistry()
    }
    return FeatureRegistry.instance
  }
  
  register(feature: BaseFeature): void {
    this.features.set(feature.getName(), feature)
    console.info('Registered feature: ' + feature.getName())
  }
  
  unregister(name: string): void {
    this.features.delete(name)
  }
  
  get(name: string): BaseFeature | undefined {
    return this.features.get(name)
  }
  
  getAll(): BaseFeature[] {
    return Array.from(this.features.values())
  }
  
  getNames(): string[] {
    return Array.from(this.features.keys())
  }
}

// 注册默认模块
FeatureRegistry.getInstance().register({
  getName: () => 'currency',
  getDescription: () => 'Currency converter',
  getVersion: () => '1.0.0'
} as BaseFeature)

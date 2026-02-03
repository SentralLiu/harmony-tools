/**
 * 常用工具函数
 */

/**
 * 格式化数字
 */
export function formatNumber(num: number, decimals: number = 2): string {
  return num.toFixed(decimals)
}

/**
 * 格式化货币
 */
export function formatCurrency(amount: number, currency: string = 'CNY'): string {
  const symbols: { [key: string]: string } = {
    'CNY': '¥',
    'USD': '$',
    'EUR': '€',
    'GBP': '£',
    'JPY': '¥'
  }
  
  const symbol = symbols[currency] || currency + ' '
  return symbol + formatNumber(amount)
}

/**
 * 延时函数
 */
export function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms))
}

/**
 * 生成唯一ID
 */
export function generateId(): string {
  return Date.now().toString(36) + Math.random().toString(36).substr(2)
}

/**
 * 检查字符串是否为空
 */
export function isEmpty(str: string | undefined | null): boolean {
  return str === undefined || str === null || str.trim() === ''
}

/**
 * 限制数值范围
 */
export function clamp(value: number, min: number, max: number): number {
  return Math.min(Math.max(value, min), max)
}

/**
 * 数组分块
 */
export function chunk<T>(array: T[], size: number): T[][] {
  const chunks: T[][] = []
  for (let i = 0; i < array.length; i += size) {
    chunks.push(array.slice(i, i + size))
  }
  return chunks
}

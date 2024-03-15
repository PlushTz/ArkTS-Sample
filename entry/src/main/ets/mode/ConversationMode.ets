/**
 * Desc:
 * @author lijt
 * Created on 2024/3/15
 * Email: lijt@eetrust.com
 */
export class ConversationMode {
  avatar: ResourceStr
  title: string
  date: string
  previewMsg: string

  constructor(avatar: ResourceStr, title: string, date: string, previewMsg: string) {
    this.avatar = avatar
    this.title = title
    this.date = date
    this.previewMsg = previewMsg
  }
}
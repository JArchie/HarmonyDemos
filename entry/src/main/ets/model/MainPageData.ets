export class TabInfo {
  index: number = 0
  img: Resource = $r('app.media.tab_index')
  selectImg: Resource = $r('app.media.tab_indexed')
  title: Resource = $r('app.string.tab_index')
}

const tabInfos: TabInfo[] = [
  {
    index: 0,
    img: $r('app.media.tab_index'),
    selectImg: $r('app.media.tab_indexed'),
    title: $r('app.string.tab_index')
  },
  {
    index: 1,
    img: $r('app.media.tab_financial'),
    selectImg: $r('app.media.tab_financialed'),
    title: $r('app.string.tab_financial')
  },
  {
    index: 2,
    img: $r('app.media.tab_video'),
    selectImg: $r('app.media.tab_videoed'),
    title: $r('app.string.tab_video')
  },
  {
    index: 3,
    img: $r('app.media.tab_message'),
    selectImg: $r('app.media.tab_messaged'),
    title: $r('app.string.tab_msg')
  },
  {
    index: 4,
    img: $r('app.media.tab_mine'),
    selectImg: $r('app.media.tab_mined'),
    title: $r('app.string.tab_mine')
  }
]

export { tabInfos }
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "studentForm" ]

  toggle(event){
    if (this.studentFormTarget.classList.contains('d-none')){
      this.show()
    } else {
      this.studentFormTarget.classList.add('d-none')
    }
  }

  show(){
    this.studentFormTarget.classList.remove('d-none')
  }
}

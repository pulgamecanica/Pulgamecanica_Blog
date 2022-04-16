import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  publish() {
    this.element.style.backgroundColor = "pink";
    let id =  this.element.dataset.postId;
    fetch("posts/publish", {
      method:'POST',
      dataType:"json",
      data: {post_id: id},
      success:function(result){
        alert(result);
      }
    });
  }
  unpublish() {
    this.element.style.backgroundColor = "brown";
    let id =  this.element.dataset.postId;
  }
}

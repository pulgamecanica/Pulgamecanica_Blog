import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  publish() {
    // this.element.style.backgroundColor = "pink";
    let id =  this.element.dataset.postId;
    fetch("publish", {
      method:'POST',
      dataType:"html",
      data: {post_id: id},
      success:function(result){
        alert(result);
      }
    });
  }
  unpublish() {
    // this.element.style.backgroundColor = "brown";
    let id =  this.element.dataset.postId;
    fetch("unpublish", {
      method:'POST',
      dataType:"html",
      data: {post_id: id},
      success:function(result){
        alert(result);
      }
    });
  }
}

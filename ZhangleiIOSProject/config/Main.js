


require('UIColor');
//自己创建的一个视图控制器
defineClass('JSPatchViewController: UIViewController', {
            
            //生命周期
            viewDidLoad: function() {
            self.super().viewDidLoad();
            self.setTitle("详情");
            self.view().setBackgroundColor(UIColor.redColor());
            //frame初始化要这种格式 UIView.alloc().initWithFrame({x:20, y:20, width:100, height:100});
            },
            
            })

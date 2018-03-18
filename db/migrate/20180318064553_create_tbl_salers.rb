class CreateTblSalers < ActiveRecord::Migration[5.0]
  def change
    create_table :tbl_salers do |t|
      t.string    :部门班组
      t.string    :姓名
      t.float     :系数
      t.numeric   :挂钩
      t.integer   :安全质量
      t.integer   :工作质量
      t.integer   :一体化
      t.integer   :兼职兼岗
      t.integer   :应发
      t.integer   :考核扣款
      t.string    :备注
      t.string    :科室车间
      t.integer   :其他
      t.string    :单项奖
      t.integer   :单项奖金额
      t.integer   :车间编号
      t.integer   :车间序号
      t.integer   :序号
      t.string    :人员分类
      t.integer   :综合
      t.integer   :捆挂
      t.integer   :安全
      t.integer   :效益
      t.integer   :小计
      t.string    :职务
      t.float     :原系数备份
      t.timestamps
    end
    add_index :tbl_salers, :工资号, unique: true
  end
end

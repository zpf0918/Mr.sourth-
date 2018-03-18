class CreateTblChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :tbl_checks do |t|
       t.integer :扣款合计
       t.integer :安全业绩扣款
       t.integer :生产经营绩效扣款
       t.integer :总重吨公里扣款
       t.integer :综合指标扣款
       t.integer :设备质量扣款
       t.integer :盈亏结果扣款
       t.integer :安全质量扣款
       t.integer :安全质量考核中牌卡扣分
       t.integer :安全质量考核中牌卡扣款
       t.integer :工作质量扣款
       t.integer :抽考扣款
       t.integer :红牌中层扣款
       t.integer :处分扣款
       t.integer :其他扣款
       t.string :科室车间
       t.integer :序号
       t.integer :挂钩考核扣款
       t.float :安全业绩扣分
       t.float :总重吨公里扣分
       t.float :综合指标扣分
       t.float :设备质量扣分
       t.float :盈亏结果扣分
       t.float :安全质量扣分
       t.float :工作质量扣分
       t.timestamps
    end
  end
end

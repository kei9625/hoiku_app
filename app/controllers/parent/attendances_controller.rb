class Parent::AttendancesController < ApplicationController
  
  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.parent_id = current_parent.id
    @attendance.date = Date.today
    
    
    # もし同じ子供で2回目のdrop_offをしているか判定する
    # find_byでデータが存在しているなら2回目とする
    tmp_attendance = Attendance.find_by(parent_id: current_parent.id, kid_id: @attendance.kid_id, date: @attendance.date)
    
    if params[:attendance][:checkout] == "drop_off"
      if tmp_attendance != nil
        if tmp_attendance.drop_off != nil
          # TODO: 方針によっては drop_offの時間を更新しても良いかもしれない
          ## @attendance = tmp_attendance
          ## @attendance.drop_off = Time.now
          ## @attendance.save!
          ## redirect_to homes_path
          ## return
          # TODO: flashでメッセージは入れた方がよい
          redirect_to homes_path
          return
        end
      end
    
      @attendance.drop_off = Time.now
    end
    
    if params[:attendance][:checkout] == "pick_up"
      if tmp_attendance != nil
        if tmp_attendance.drop_off != nil 
          if tmp_attendance.pick_up == nil 
            # 既にデータはあるのでidを埋めてt更新処理に切り替える
            @attendance = tmp_attendance
            # pick_up時刻を記録
            @attendance.pick_up = Time.now
          end
        end
      end
    end
    
    
    if @attendance.save!
      # TODO: 詳細ページへ遷移させる？
      redirect_to homes_path
    else
    end
  end
  
  def update
  end
  
  def destroy
    # もし間違って登園してしまった場合は、attendance/showで「取り消しボタン(destroy)でレコードを削除」を作成するとUI的に優しい
  end
  
  private

  def attendance_params
    
    params.require(:attendance).permit(:kid_id, :parent_id, :employee_id, :date, :drop_off, :pick_up, :note, :status)
  end
end
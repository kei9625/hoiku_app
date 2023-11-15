class Employee::AttendancesController < ApplicationController

  def index
    @attendances = Attendance.where(parent_id: current_parent.id)
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def update
    @attendance = Attendance.find(params[:id])
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

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
          redirect_to parent_attendance_path(current_parent, attendance)
          return


          # 削除して新たにデータを作成する流れにするのであれば
          # 32行目のTODO 当たりから現在までのコードを全てコメントアウトor削除する
          # その上で削除処理を盛り込めればよい
          # tmp_attendance.destroy! # 削除完了
          # @attendance.drop_off = Time.now
          #if @attendance.save!
          #  redirect_to homes_path
          #end
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


  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy!
    flash[:notice] = "登降園情報を削除しました"
    redirect_to parent_attendances_path(current_parent.id)
    # もし間違って登園してしまった場合は、attendance/showで「取り消しボタン(destroy)でレコードを削除」を作成するとUI的に優しい
  end

  private

  def attendance_params
    params.require(:attendance).permit(:kid_id, :parent_id, :employee_id, :date, :drop_off, :pick_up, :note, :status)
  end
  
end

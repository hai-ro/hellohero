module ApplicationHelper
  def page_title
    title = 'ハロヒロ'
    title = @page_title + " | " + title if @page_title
    title
  end
  
  def shape_create_time(created_at)
    created_at.strftime("%Y/%m/%d %H:%M:%S")
  end
  
  def shape_update_time(updated_at)
    updated_at.strftime("%Y/%m/%d %H:%M:%S")
  end
  
  def shape_start_datetime(start_datetime)
    start_datetime.strftime("%Y/%m/%d %H:%M")
  end
  
  def shape_datetime_ja(start_datetime)
    start_datetime.strftime("%Y年%-m月%-d日 %H:%M")
  end
  
  def shape_end_datetime(end_datetime)
    end_datetime.strftime("%Y/%m/%d %H:%M")
  end
  
  def shape_job_date(start_datetime)
    start_datetime.strftime("%Y/%m/%d")
  end
  
  def shape_job_start_time(start_datetime)
    start_datetime.strftime("%H:%M")
  end
  
  def shape_job_end_time(end_datetime)
    end_datetime.strftime("%H:%M")
  end
end

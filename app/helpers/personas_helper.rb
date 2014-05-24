module PersonasHelper
  def ver_todos
    link_to t('.all'), personas_path if params[:q].present?
  end
end

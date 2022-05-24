module PerformancesHelper
  def performance_lists(performances)
    html = ''
    performances.each do |performance|
      html += render(partial: 'performance',locals: { performance: performance })
    end
    return raw(html)
  end
end


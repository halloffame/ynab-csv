ynab_cols = ['Date','Payee','Category','Memo','Outflow','Inflow']
numberfy = (val) ->
  # check for negative signs or parenthases.
  is_negative = if (val.match("-") || val.match(/\(.*\)/)) then -1 else 1
  # return just the number and make it negative if needed.
  +val.match(/\d+.?\d*/)[0] * is_negative

parseDate = (val) -> moment(val).format('MM/DD/YYYY') if val && val.length > 0

class window.DataObject
  constructor: () ->
    @base_json = null

  parse_csv: (csv) -> @base_json = $.parse(csv)
  fields: -> @base_json.results.fields
  rows: -> @base_json.results.rows

  converted_json: (limit, lookup) ->
    return nil if @base_json == null
    value = []

    if @base_json.results.rows
      @base_json.results.rows.forEach (row, index) ->
        if !limit || index < limit
          tmp_row = {}
          ynab_cols.forEach (col) ->
            cell = row[lookup[col]]

            switch col
              when 'Date' then tmp_row[col] = parseDate(cell)
              when 'Outflow'
                number = numberfy(cell)
                if lookup['Outflow'] == lookup['Inflow']
                  tmp_row[col] = Math.abs(number) if number < 0
                else
                  tmp_row[col] = number
              when 'Inflow'
                number = numberfy(cell)
                if lookup['Outflow'] == lookup['Inflow']
                  tmp_row[col] = number if number > 0
                else
                  tmp_row[col] = number
              else tmp_row[col] = cell

          value.push(tmp_row)
    value

  converted_csv: (limit, lookup) ->
    return nil if @base_json == null
    string = ynab_cols.join(',') + "\n"
    @.converted_json(limit, lookup).forEach (row) ->
      row_values = []
      ynab_cols.forEach (col) ->
        row_values.push row[col]
      string += row_values.join(',') + "\n"
    string
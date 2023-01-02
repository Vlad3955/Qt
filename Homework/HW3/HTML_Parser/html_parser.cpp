#include "html_parser.h"
#include "ui_html_parser.h"

HTML_Parser::HTML_Parser(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::HTML_Parser)
{
    ui->setupUi(this);
}

HTML_Parser::~HTML_Parser()
{
    delete ui;
}


void HTML_Parser::on_pb_get_clicked()
{
    QFile file(":/html/mail_ru.txt");
    if (file.open(QIODevice::ReadOnly))
    {
        QByteArray ba = file.readAll();
        QString text(ba);
        QString reg_ex = "(<div class=\"rate__currency svelte-ov6yem\">)([\\d.]+)(</div>)";
        QStringList num = getData(text, reg_ex);
        ui->le_usd->setText(num[0]);
        ui->le_rub->setText(num[1]);

        reg_ex = "(<span title=\"ощущается как -2°\" class=\"weather__temp svelte-xn9nd0\" data-testid=\"weather-temp\">)([\\-\\+\\d]+\\°)(</span>)";
        num.append(getData(text, reg_ex).back());
        ui->le_weather->setText(num[2]);
    }
}

QStringList HTML_Parser::getData(const QString &text, const QString &reg_ex)
{
    QRegularExpression re(reg_ex);
    QRegularExpressionMatchIterator i = re.globalMatch(text);
    QStringList list;
    while (i.hasNext())
    {
        QRegularExpressionMatch match = i.next();
        list.append(match.captured(2));

    }
    return list;
}


package edu.sam.aveng.base.converter;

import edu.sam.aveng.base.contract.converter.IShortConverter;
import edu.sam.aveng.base.contract.converter.IBaseConverter;
import edu.sam.aveng.base.contract.converter.ICollectionConverter;
import edu.sam.aveng.base.model.domain.Card;
import edu.sam.aveng.base.model.domain.Pronunciation;
import edu.sam.aveng.base.model.domain.Sample;
import edu.sam.aveng.base.model.transfer.dto.CardDto;
import edu.sam.aveng.base.model.transfer.dto.PronunciationDto;
import edu.sam.aveng.base.model.transfer.dto.SampleDto;
import edu.sam.aveng.base.model.transfer.dto.ShortCardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Component
public class CardConverter
        implements IShortConverter<Card, CardDto, ShortCardDto> {

    private ICollectionConverter<Sample,
                    SampleDto> sampleConverter;

    private IBaseConverter<Pronunciation,
                PronunciationDto> pronConverter;

    @Autowired
    @Qualifier("sampleConverter")
    public void setSampleConverter(ICollectionConverter<Sample,
                    SampleDto> sampleConverter) {
        this.sampleConverter = sampleConverter;
    }

    @Autowired
    @Qualifier("pronConverter")
    public void setPronConverterConverter(IBaseConverter<Pronunciation,
                PronunciationDto> pronConverter) {
        this.pronConverter = pronConverter;
    }

    @Override
    public CardDto convertToDto(Card card) {

        List<SampleDto> sampleDtos =
                sampleConverter.convertToDto(card.getSamples())
                        .collect(Collectors.toList());

        CardDto dto = new CardDto();

        dto.setId(card.getId());
        dto.setContent(card.getContent());
        dto.setType(card.getType());
        dto.setPron(pronConverter.convertToDto(card.getPron()));
        dto.setDefinition(card.getDefinition());
        dto.setSamples(sampleDtos);

        return dto;
    }

    @Override
    public Card convertToEntity(CardDto cardDto) {
        Card card = new Card();

        List<Sample> samples  = sampleConverter
                .convertToEntity(cardDto.getSamples())
                .collect(Collectors.toList());

        card.setId(cardDto.getId());
        card.setContent(cardDto.getContent());
        card.setType(cardDto.getType());
        card.setPron(pronConverter.convertToEntity(cardDto.getPron()));
        card.setDefinition(cardDto.getDefinition());
        card.addSamples(samples);

        return card;
    }

    @Override
    public Stream<ShortCardDto> convertToShortDto(Collection<Card> cards) {
        return cards.stream()
                .map(card -> {
                    ShortCardDto shortCardDto = new ShortCardDto();

                    shortCardDto.setId(card.getId());
                    shortCardDto.setContent(card.getContent());
                    shortCardDto.setType(card.getType());
                    shortCardDto.setDefinition(card.getDefinition());

                    return shortCardDto; });
    }

    @Override
    public Stream<CardDto> convertToDto(Collection<Card> entities) {
        return null;
    }

    @Override
    public Stream<Card> convertToEntity(Collection<CardDto> dtos) {
        return null;
    }

}
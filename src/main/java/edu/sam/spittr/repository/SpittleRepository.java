package edu.sam.spittr.repository;

import edu.sam.spittr.dto.SpittleDTO;

import java.util.List;

public interface SpittleRepository {
    /**
     * @param max - maximum ID of any SpittleDTO that should be returned.
     * @param count - indicates how many SpittleDTO objects to return.
     * @return
     */
    List<SpittleDTO> readSpittles(long max, int count);

    long create(SpittleDTO newSpittle);

    // Finds a SpittleDTO by ID
    SpittleDTO readById(long id);

    // Update a SpittleDTO
    long update(long id, SpittleDTO spittle);

    long delete(long id);
}